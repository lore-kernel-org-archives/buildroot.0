From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:19:53 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: bump to version 1.5
In-Reply-To: <20180610134244.5369-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Jun 2018 15:42:44 +0200")
References: <20180610134244.5369-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2ldaxee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Remove patch (already in version)
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

How much have you tested this? I haven't followed the discussion on
mosquitto-dev in a lot of details, but apparently there is an unresolved
crash issue:

https://github.com/eclipse/mosquitto/issues/505

And a compilation issue caused by a variable name change:

https://github.com/eclipse/mosquitto/pull/810

-- 
Bye, Peter Korsgaard
