From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 2 Jul 2010 15:08:35 +1000
Subject: [Buildroot] kernel modules & embedded linux
In-Reply-To: <AANLkTikCi6vziDJANiDx03Fhic26UKGCg2dyn6ZrdU9K@mail.gmail.com>
References: <AANLkTilauXcR4dwy7PUrelaKdREP4xgMBad2i0ixYfqG@mail.gmail.com> 
	<AANLkTikCi6vziDJANiDx03Fhic26UKGCg2dyn6ZrdU9K@mail.gmail.com>
Message-ID: <AANLkTil4dNZojTv1HZ89UZ25HEXNUaBrhPJLKnvntysH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 1, 2010 at 5:42 PM, Mohamed Mohamed Nour El-Din
<eng.mohamed.nour.eldin@gmail.com> wrote:
>
> what i'm facing is that lsmod doesn't give any output, i can't get any info
> about automatically loaded modules, only i can list the modules loaded
> manually using insmod or modprobe
> also there's no modules.conf file in /etc

Can you send us (ie, to this list) a copy of what you're doing that
you think should work?

For example, what happens when you run "cat /proc/modules"?  Do you
have the right modules for your hardware, installed in the right place
in the filesystem?  Did you run "depmod -a"?  Is there anything
relevant in /var/log/messages?

We need to see what you're trying to do.

Mitch.
