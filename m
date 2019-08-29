From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Aug 2019 11:27:10 +0000
Subject: [Buildroot] [Bug 12131] qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
In-Reply-To: <bug-12131-163@https.bugs.busybox.net/>
References: <bug-12131-163@https.bugs.busybox.net/>
Message-ID: <bug-12131-163-k6cwAfKzgN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

--- Comment #6 from Patrick Koller <koller@stettbacher.ch> ---
Hi Giulio

Welcome back! I hope, you enjoyed your holiday to the fullest :)

Thanks for your help, I really appreciate your support.
I just applied your suggested changes to my configuration, but
another error showed up. Let me first tell you, what I did:

- Removed "-device imx6" from BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS
- Changed floating point strategy to NEON
- make clean && make

The qt5base build process failed due to the following error:

ERROR: Feature 'eglfs' was enabled, but the pre-condition
'!config.android && !config.darwin && !config.win32 && features.egl' failed.
(Log-File: 190829_error_no_device_and_neon)

Do you know, what is going on and could you please give me a hint?

Thanks a lot :)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
