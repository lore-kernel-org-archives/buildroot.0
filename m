From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 14:50:49 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com> (Wolfgang
 Grandegger's message of "Mon, 13 Nov 2017 08:17:20 +0100")
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
Message-ID: <87d14ms2x2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

Hi,

 > This means: A symbolic link would work.

Ok, great - Makes sense. I wonder how much effort it wil be to get
binutils to generate symbolic links instead of hard links.

-- 
Bye, Peter Korsgaard
