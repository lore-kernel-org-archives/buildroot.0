From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCh0LDRhdC90L4=?= <sergei.sakhno@gmail.com>
Date: Tue, 22 Jan 2019 19:38:44 +0200
Subject: [Buildroot] Error while build with python3 modules
Message-ID: <CAOqJNTfhysiTA1RO91QTy8aWShcaNLzfo=fs7trwyQM8mxbv1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am selected python3 and python-pip, and while build i got error:

> >>> python-pip 18.1 Building
> (cd /home/user/GIT/standard/output/build/python-pip-18.1//;
> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabihf"
> PATH="/home/user/GIT/standard/output/host/bin:/home/user/GIT/standard/output/host/sbin:/home/user/bin:/home/user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
> PYTHONPATH="/home/user/GIT/standard/output/target/usr/lib/python3.7/"
> PYTHONNOUSERSITE=1
> _python_sysroot=/home/user/GIT/standard/output/host/arm-buildroot-linux-gnueabihf/sysroot
> _python_prefix=/usr _python_exec_prefix=/usr
> /home/user/GIT/standard/output/host/bin/python setup.py build  )
>   File "/home/user/GIT/standard/output/target/usr/lib/python3.7/site.py",
> line 177
>     file=sys.stderr)
>         ^
> SyntaxError: invalid syntax
> package/pkg-generic.mk:230: recipe for target
> '/home/user/GIT/standard/output/build/python-pip-18.1/.stamp_built' failed
> make[1]: ***
> [/home/user/GIT/standard/output/build/python-pip-18.1/.stamp_built] Error 1
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2
>
After added python3 and puthon-aiohttpi got same error. Or am I doing
something wrong?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/700b8dcd/attachment.html>
