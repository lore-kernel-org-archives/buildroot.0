From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2019 09:59:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/clamav: fix clamsubmit linking
In-Reply-To: <6c74c8a5-b946-d8fa-53f3-7bc7ebf76471@mind.be> (Arnout
 Vandecappelle's message of "Mon, 14 Oct 2019 00:47:55 +0200")
References: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
 <20191012170455.9816-2-fontaine.fabrice@gmail.com>
 <c3872f5d-35c7-eb96-e48a-a4a42d01e790@mind.be>
 <CAPi7W838ORXVNLx-0=yoQhLd-Ub65UYWp2a5kUXhSpV2WW0bfA@mail.gmail.com>
 <6c74c8a5-b946-d8fa-53f3-7bc7ebf76471@mind.be>
Message-ID: <87bluizbfa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  I have no idea what the proper solution is at the autotools level.

 >  However, I just added 'OBJC=$(TARGET_CC)' to clamav's CONF_ENV and that seems
 > to work.

That seems like the simplest/sanest workaround to me as well.

-- 
Bye, Peter Korsgaard
