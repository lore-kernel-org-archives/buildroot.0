From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 08:52:03 +0100
Subject: [Buildroot] ntp pool vendor request
In-Reply-To: <CANQCQpZZ5J+wKOqjD+sxxEr4XLfUE+1jFErooopDsO5n6qkZwg@mail.gmail.com>
 (Matthew Weber's message of "Tue, 11 Dec 2018 21:53:38 -0600")
References: <CANQCQpZZ5J+wKOqjD+sxxEr4XLfUE+1jFErooopDsO5n6qkZwg@mail.gmail.com>
Message-ID: <87h8ffcjmk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > As part of a ntp scripting update, Arnout brought up creating our own
 > ntp pool.  I took a look at [1] to start the process to get
 > buildroot.pool.ntp.org domain.  It looks like someone has to have an
 > account to request it and then provide the following information.  Any
 > takers?  I can log in and fill it out but I assume we may want a
 > list/group email to own this?

 > #Zone name:
 > buildroot

 > #Organization name:
 > Buildroot ?

Yes, that is probably fine.

 > #Vendor Zone Information
 > What devices will use the pool?  How often will they poll? Please read
 > the [2]. (only visible to the NTP Pool admins)

 > #Device count ( < 1000,  < 10000, etc )
 > Wasn't sure how to handle this.....

I wonder how other open source projects handle this. I know that
E.G. Openwrt and Debian have a dedicated pool.

 > #Contact Information
 > Email addresses, direct phone numbers for your NOC or
 > network/engineering technical support (only visible to the NTP Pool
 > admins)

Maybe we can use buildroot-association at buildroot.org for the email. I'm
OK wth giving my phone number (off list) if needed.

-- 
Bye, Peter Korsgaard
