From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 23:48:54 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add optional libmpdclient
 dependency
In-Reply-To: <CAPi7W80xVMC0BuVvYLKwXJnMTcHV2Zpo7w_gnnAihBhhBpwvDQ@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 2 Apr 2018 18:41:41 +0200")
References: <20180402111134.23776-1-fontaine.fabrice@gmail.com>
 <874lktois3.fsf@dell.be.48ers.dk>
 <CAPi7W80xVMC0BuVvYLKwXJnMTcHV2Zpo7w_gnnAihBhhBpwvDQ@mail.gmail.com>
Message-ID: <87370dl1o9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> All other optional dependencies are handled by a BR2_PACKAGE_MPD_<foo>
 >> suboption. Any specific reason why you are not doing that here?
 >> 
 > Yes, you're right that all dependencies except icu have an option.
 > I'll add also it for libmpdclient, I was just thinking that the best
 > practice was to avoid adding an option.

Normally yes, but we also try to keep some consistency between the
various options in a package.

I believe the sub options have been added for mpd because it isn't
really obvious what other packages you need to enable to get a specific
feature enabled.

-- 
Bye, Peter Korsgaard
