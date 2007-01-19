From: Claus Klein <claus.klein@arcormail.de>
Date: Fri, 19 Jan 2007 16:51:07 +0100
Subject: [Buildroot] install uClibc daily snapshot failes
In-Reply-To: <20070118102927.GB6515@aon.at>
References: <200701170833.04970.claus.klein@arcormail.de>
	<200701172114.08730.claus.klein@arcormail.de>
	<20070118102927.GB6515@aon.at>
Message-ID: <200701191651.07462.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 18 January 2007 11:29, Bernhard Fischer wrote:
> >> What is your echo $LD_LIBRARY_PATH ?
> >> 
> >> 
> >claus at P3linux:~/src/buildroot> echo $LD_LIBRARY_PATH
> >/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:
> --------------------------------------------------------------------^
> 
> fix your LD_LIBRARY_PATH, no patch needed.
> 
> HTH,
> 
> 
Hi,

thanks for your help, you are right.

I din't know that the tailing ':' is the same as ':.'

I'm working with OpenSuse 10.1 and I can't find the config file, which writes this LD_LIBRARY_PATH.
While about 2 years working with buildrout I had no problem with my LD_LIBRARY_PATH!

I would like to hear that the Makefile will be changed to my version. 
This works always!


PS: There is no note about LD_LIBRARY_PATH in the buildroot docu!


Bye,

Claus
