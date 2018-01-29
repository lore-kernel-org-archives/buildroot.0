From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 09:41:38 +0100
Subject: [Buildroot] buildroot imagw upgrade
In-Reply-To: <trinity-01900f6e-e7da-4b49-b3b3-4f08bea4a85f-1517212721295@3c-app-mailcom-bs04>
 (daggs@gmx.com's message of "Mon, 29 Jan 2018 08:58:41 +0100")
References: <trinity-7ce85c6f-3278-4055-8377-0c3a03dd9a1a-1516300080914@3c-app-mailcom-bs09>
 <87shaqdjqm.fsf@dell.be.48ers.dk>
 <trinity-01900f6e-e7da-4b49-b3b3-4f08bea4a85f-1517212721295@3c-app-mailcom-bs04>
Message-ID: <87shap83b1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

Hi,

 > I have a dtv server running image based on buildroot, it gets stuck
 > every day requiring me to reboot it.  I want to upgrade the image but
 > I have data and config I want to keep.

And you have not separated your data/config from the buildroot image
(E.G. on another filesystem)?

> my first idea was to preform and upgrade, that is why I'm asking.

Upgrade handling is always quite system specific, and outside the scope
of Buildroot.

We do provide a number of packages related to upgrade handling, but
Buildroot is just a toolbox - It doesn't enforce any specific behaviour.

-- 
Bye, Peter Korsgaard
