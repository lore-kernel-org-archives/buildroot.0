From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 19:37:45 +0100
Subject: [Buildroot] [PATCH next 0/3] dbus-python cleanup and python3
	support
In-Reply-To: <20141122192456.69ad67bd@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 22 Nov 2014 19:24:56 +0100")
References: <1416491611-19815-1-git-send-email-peter@korsgaard.com>
 <20141122192456.69ad67bd@free-electrons.com>
Message-ID: <878uj3ulmu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Dear Peter Korsgaard,
 > On Thu, 20 Nov 2014 14:53:28 +0100, Peter Korsgaard wrote:

 >> Peter Korsgaard (3):
 >> dbus-python: cleanup package
 >> python3: add patch to fix --includes / --ldflags output of python3-config
 >> dbus-python: add python3 support

 > Thanks, series applied to next. Probably the first time that I apply
 > some patches from you :-)

;)

 > I found one minor issue: on the last patch, you forgot to update the
 > dependencies of the comment, so I added the following change to your
 > patch:

 >  comment "dbus-python needs a toolchain w/ wchar, threads"
 > -       depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON
 > +       depends on BR2_PACKAGE_DBUS && (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)

Ahh yes, thanks

-- 
Bye, Peter Korsgaard 
