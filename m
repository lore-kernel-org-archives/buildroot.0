From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 09:56:24 +0200
Subject: [Buildroot] [PATCH 2/2] powerpc-utils: remove --without-librtas
In-Reply-To: <20150511060007.GQ2558@tarshish> (Baruch Siach's message of "Mon, 
 11 May 2015 09:00:07 +0300")
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
 <05714bb15869de4bead83eec7df5e9c9b0bd8fa7.1431059241.git.sam.bobroff@au1.ibm.com>
 <20150508045758.GH2183@tarshish> <554FFB2F.2010102@au1.ibm.com>
 <20150511043445.GO2558@tarshish>
 <20150511055303.GA3583@ocelot.ozlabs.ibm.com>
 <20150511060007.GQ2558@tarshish>
Message-ID: <873833k0nr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> > These are valid reasons. What is the target installed size of librtas compared 
 >> > to powerpc-utils?
 >> 
 >> This might be a bit rough but it looks like:
 >> 
 >> * librtas: 360Kb
 >> * powerpc-utils with librtas: 1,660Kb
 >> .. for a total of  2020Kb
 >> 
 >> * powerpc-utils without librtas: 484Kb
 >> 
 >> So it looks like the increase is about 1.5Mb (or 3x, depending on how you look
 >> at it).

 > This is a significant increase. In this case I think it is best to give the 
 > user an explicit option like you suggested. Mentioning these numbers in the 
 > option help text should also be useful, I guess.

Yes, I agree for such a big increase in size.

-- 
Bye, Peter Korsgaard
