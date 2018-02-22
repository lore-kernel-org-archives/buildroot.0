From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 21 Feb 2018 22:53:18 -0300
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
References: <1518701885-16545-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <5a8e228e69301_2426136620c3284e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Feb 15, 2018 at 11:38 AM, Yegor Yefremov wrote:

[snip]
> ---
>  .../testing/tests/package/test_python_crossbar.py  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 support/testing/tests/package/test_python_crossbar.py

The update to .gitlab.yml can be added now that 'make .gitlab-ci.yml' is fixed
(on master).

[snip]
> +++ b/support/testing/tests/package/test_python_crossbar.py

My series fixing flake8 warnings are now mostly applied (a few items need v2).

Can you run flake8 and fix the 7 warnings? You can see the updated
test_python.py for reference.


I applied this and also
http://patchwork.ozlabs.org/patch/874421/
http://patchwork.ozlabs.org/patch/874422/
but the test still fails with timeout:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/53345963
I did not debugged it.

Maybe I missed something?


Regards,
Ricardo
