From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:56:35 +0200
Subject: [Buildroot] [PATCH v2 0/6] Python/IPython unit test changes
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170722225635.33d86f22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:40:03 -0700, Andrey Smirnov wrote:

> Andrey Smirnov (6):
>   testing/infra/emulator: allow to specify pexpect timeout
>   testing/tests/package/test_python: refactor TestPythonBase
>   testing/tests/package/test_python: add TestPython3
>   testing/tests/package/test_python: do not hardcode interpreter name
>   testing/tests/package/test_python: allow to change timeout
>   testing/tests/package: add basic unit test for IPython

I've applied the remaining patches 3 to 6. One thing was missing:
updating the .gitlab-ci.yml file, so I've done that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
