From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 12:35:37 +0200
Subject: [Buildroot] how to add user to rootfs?
In-Reply-To: <1238493632.14498.11.camel@hactar.vie.riedel.net> (Bernhard
	Weirich's message of "Tue\, 31 Mar 2009 12\:00\:32 +0200")
References: <1238493632.14498.11.camel@hactar.vie.riedel.net>
Message-ID: <87hc1a9dza.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Weirich <weirich@riedel.net> writes:

 Bernhard> Hello,

 Bernhard> I have added a new user to /etc/shadow and /etc/passwd but
 Bernhard> how do I tell genext2 that the directory /home/user does
 Bernhard> not belong to root?  There is some magic going on that
 Bernhard> /home/default is owned by "default" in the resulting rootfs
 Bernhard> but I have not understood how it works.  Can anyone help me
 Bernhard> on this?

It's done using the device_table.txt in target/generic. Have a look at
the /home/default line for the syntax.

-- 
Bye, Peter Korsgaard
