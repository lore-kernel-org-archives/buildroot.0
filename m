From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Oct 2013 08:51:07 +0200
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
Message-ID: <20131026085107.40230e6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 25 Oct 2013 10:52:54 -0500, Ryan Barnett wrote:

> A while back (about a week ago) - Gustavoz Zacarias, Thomas Petazzoni, and 
> myself - were having a conversation on the IRC about creating a new 
> package type for handling the builds of python packages. If I recall 
> correctly, this is what we discussed. I would like to just have some 
> record on how we want to handle building python packages.
> 
> Thomas P and Gustavoz - please correct/expand on any points that I may be 
> missing.
> 
> pkg-python infrastructure
> -------------------------
> 
>  * Would add a new makefile defining generic build steps for python 
> packages under package/pkg-python.mk.
> 
>  * Would support building for Python 2.7 and Python 3+.
> 
>  * Would ensure that cross-compiling of python packages is handled 
> correctly.
> 
>  * Would support setup.py and setuptools packages.
> 
> I don't know when I will be able to get around to doing this but I would 
> like to at least capture the points that were made. Also anyone else is 
> welcome to pick up this work too :)

I definitely confirm that the number of Python modules packages has
grown quite significantly, and that it is certainly time to look at
creating a common infrastructure for those that are based on
setup.py/setuptools. If anyone is interested in working on this, it'd
be great. I just want to warn that it doesn't look like an easy task,
as cross-compilation with Python can be a bit tricky.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
