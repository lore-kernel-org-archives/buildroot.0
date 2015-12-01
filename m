From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:33:03 +0100
Subject: [Buildroot] [PATCH] busybox: add another upstream patch to fix
	unzip
In-Reply-To: <565E1A6A.2030707@mind.be> (Arnout Vandecappelle's message of
 "Tue, 1 Dec 2015 23:08:42 +0100")
References: <1449001829-26507-1-git-send-email-arnout@mind.be>
 <20151201223025.0b777fd7@free-electrons.com>
 <87y4ddj0k5.fsf@dell.be.48ers.dk> <565E1A6A.2030707@mind.be>
Message-ID: <87h9k1iyu8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > Sad to have to do this just one day after 2015.11 release, but it's
 >> > really not great to have such a major issue left in 2015.11.
 >> 
 >> No, indeed not :/ And the patch was even an upstream fix. Where does
 >> this new patch come from, I don't see it on
 >> http://busybox.net/downloads/fixes-1.24.1/?

 >  I took it straight from git.

Ahh, saw it now. It would be good to get Denys to add it to the fixes
directory as well.

How easy is it to trigger? I did a quick test in qemu and wasn't able to
trigger it.

-- 
Venlig hilsen,
Peter Korsgaard 
