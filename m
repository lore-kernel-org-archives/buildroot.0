From: Roeland Van Praet <roelvp@mind.be>
Date: Fri, 27 Mar 2009 15:25:03 +0100
Subject: [Buildroot] Buildroot GUI
In-Reply-To: <5077064A-237A-4F92-9395-197141542D06@cannasoftware.com>
References: <5077064A-237A-4F92-9395-197141542D06@cannasoftware.com>
Message-ID: <1238163903.6667.28.camel@ess-roelvp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think it's a good idea and will be helpfull for less skillful people,
but there are some points worth to notice:

First, there already is a GUI, namely 'make menuconfig'.
Ok, there is no mouse interaction, but the idea is the same.

Second, in my experience, in order to use Buildroot you need to have
some skills to "just run the code".
Most of the time you have to do some extra stuff than just selecting the
required packages.
Thus, you will probably have to be a better skilled developer to set up
a good configuration and won't be daunted by the default configuration
tool.

Of course, for somebody willing to learn Buildroot, it might help a lot.
But sometimes it's better to learn it the hard way: you'll learn more
and at least know how things work.

Don't see it as a big 'NO' on my part, I'm just giving my opinion. :)

As far as implementation goes, I don't think it will be difficult.
The GUI should just be able to read the Config.in files and the tree
structure, show the contents and generate a .config file.
This will continue to work independently of any changes to the packages.

Regards,

Roeland



On Fri, 2009-03-27 at 08:55 -0500, Lloyd Sargent wrote:

> Hi,
> 
> I don't know if this has been done or even if it is a good idea, but  
> I've been toying with the idea of a Buildroot GUI.
> 
> Not that Buildroot is a hard system to learn, but it can be very  
> daunting to the guy who "just wants to run code".
> 
> I hadn't on making this a full IDE (I've worked with TI's DevRocket  
> and was NOT impressed), but would in fact allow people to set it up to  
> call their editor of choice. I'm not keen on writing editors.
> 
> So, is this a good idea, bad idea, or very problematic given the way  
> Buildroot changes?
> 
> Cheers,
> 
> Lloyd
> 
> -----
> 
> Lloyd Sargent
> Canna Software
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



Roeland Van Praet

Embedded Software Developer
Mind - an ESSENSIUM nv division
Gaston Geenslaan 9 - B 3001 Leuven - Belgium
web : www.mind.be
mail: roelvp at mind.be
tel : +32 16 28 65 34
fax : +32 16 28 65 01 
BE 872 984 063 RPR Leuven
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090327/bd904902/attachment.htm>
