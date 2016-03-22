import subprocess

import click

from runutils import runbash, ensure_user, get_user_ids, setuser


USER_NAME, USER_ID, GROUP_NAME, GROUP_ID = get_user_ids('dev', 1000)


@click.group()
def run():
    ensure_user(USER_NAME, USER_ID, GROUP_NAME, GROUP_ID)


@run.command()
@click.argument('user', default=USER_NAME)
def bash(user):
    runbash(user)


@run.command()
def start():
    cwd = '/var/lib/data'
    texfile = 'input/test.tex'
    output_directory = 'output'
    cmd = ['lualatex', '--output-directory=%s' % output_directory, texfile]
    preexec_fn = setuser(USER_NAME)
    subprocess.call(cmd, preexec_fn=preexec_fn, cwd=cwd)


if __name__ == '__main__':
    run()
