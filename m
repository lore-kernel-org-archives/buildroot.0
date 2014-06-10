From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 11:48:14 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as	openvpn keys, conf
In-Reply-To: <279642119.17500579.1402392817223.JavaMail.root@openwide.fr>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <279642119.17500579.1402392817223.JavaMail.root@openwide.fr>
Message-ID: <20140610114814.62cace46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Tue, 10 Jun 2014 11:33:37 +0200 (CEST), Jeremy Rosen wrote:
> 
> All file ownership are given to root in the fakeroot container,
> 
> the fakeroot container is applied after the overlay
> 
> 
> So, (assuming I understant correctly what's going on) you don't neet to have these files owned by root in the overlay. Ownership will be changed while the final image is built

Could you please learn about the usual rules about replying on mailing
lists, and make sure to not top-post, and to use an e-mail that wraps
lines to a reasonable length.

As a hint, I would suggest to not use Zimbra as your e-mail client,
from what I've seen all the people using it can only send e-mails
improperly formatted.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
