From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 12 Mar 2020 06:42:32 +0000
Subject: [Buildroot] optee-os build failed in buildroot-2020.02
Message-ID: <VI1PR04MB5136A84B00B28E4EB31EA690FEFD0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all guys,
I am using buildroot-2020.02 to build optee-client/optee-so/optee-test, when I build optee-os, I got below error.
Could you please give some comment how to resolve this issue?

Traceback (most recent call last):
  File "scripts/pem_to_pub_c.py", line 61, in <module>
    main()
  File "scripts/pem_to_pub_c.py", line 24, in main
    from Crypto.PublicKey import RSA
ModuleNotFoundError: No module named 'Crypto'

BTW, 
I find one building error from below website (3 March) too, but I didn't find the solution.
https://gitlab.com/buildroot.org/buildroot/-/jobs/456818689

Thanks a lot.

Best Regards
Jerry Huang
