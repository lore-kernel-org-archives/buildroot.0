From: Mohamed Mohamed Nour El-Din <eng.mohamed.nour.eldin@gmail.com>
Date: Fri, 2 Jul 2010 21:34:24 +0300
Subject: [Buildroot] kernel modules & embedded linux
In-Reply-To: <AANLkTil4dNZojTv1HZ89UZ25HEXNUaBrhPJLKnvntysH@mail.gmail.com>
References: <AANLkTilauXcR4dwy7PUrelaKdREP4xgMBad2i0ixYfqG@mail.gmail.com> 
	<AANLkTikCi6vziDJANiDx03Fhic26UKGCg2dyn6ZrdU9K@mail.gmail.com> 
	<AANLkTil4dNZojTv1HZ89UZ25HEXNUaBrhPJLKnvntysH@mail.gmail.com>
Message-ID: <AANLkTim7hTnNTC5z-cOKnbbyXe8lFWaixTL9jobwjZQD@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 2, 2010 at 8:08 AM, Mitch Davis
<mjd+buildroot at afork.com<mjd%2Bbuildroot@afork.com>
> wrote:

> On Thu, Jul 1, 2010 at 5:42 PM, Mohamed Mohamed Nour El-Din
> <eng.mohamed.nour.eldin@gmail.com> wrote:
> >
> > what i'm facing is that lsmod doesn't give any output, i can't get any
> info
> > about automatically loaded modules, only i can list the modules loaded
> > manually using insmod or modprobe
> > also there's no modules.conf file in /etc
>
> Can you send us (ie, to this list) a copy of what you're doing that
> you think should work?
>
> For example, what happens when you run "cat /proc/modules"?  Do you
> have the right modules for your hardware, installed in the right place
> in the filesystem?  Did you run "depmod -a"?  Is there anything
> relevant in /var/log/messages?
>
> We need to see what you're trying to do.
>
> Mitch.
>

i built this system with qt to run gui,
but the booting & the system in general is somehow slow, so i wanted to list
the modules loaded with the system startup to see if i can remove some of
them
after the system starts & when i run lsmod, i get nothing, /proc/modules is
empty
there's no modules.conf or conf.modules
i made a new kernel image & selected some options to compile as modules
so i can insert them manually & list them
depmod -a didn't make any difference
i didn't know what to search for in /var/log/messages, it contains a lot of
data
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100702/4ceb7476/attachment.html>
