From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Mar 2016 16:25:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-01
In-Reply-To: <20160302162156.2c4d6d13@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 2 Mar 2016 16:21:56 +0100")
References: <20160302073023.58B81101BA9@stock.ovh.net>
 <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
 <20160302160423.0143a79b@free-electrons.com>
 <878u20kiw7.fsf@dell.be.48ers.dk>
 <20160302162156.2c4d6d13@free-electrons.com>
Message-ID: <871t7skilh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> So this is horrible broken :/

 > Ah, I understand better. I was confused by Jeroen's report, since his
 > report was essentially "nginx concludes that SPARC is big endian",
 > which was not wrong at all.

 > Thanks for the explanation. Then indeed, passing NGX_HAVE_LITTLE_ENDIAN
 > seems like the right thing to do.

 > Does this means that nginx has never worked on little endian platforms ?

Yes, it looks like it. Samuel, you added nginx, on what platforms have
you used it?

-- 
Venlig hilsen,
Peter Korsgaard 
