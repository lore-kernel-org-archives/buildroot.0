From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Oct 2013 11:42:28 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
Message-ID: <20131023114228.619fedd9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Tue, 22 Oct 2013 19:06:41 +0200, arnaud aujon wrote:

> As we talk earlier in the mailing list, I started working on a python
> script to automatically check if a package can be updated.
> 
> For now, the result of the script is : 837 packages (115 up to date, 154
> old and 568 unknown)
> So the script is able to check that 115 packages are up to dates and that
> 154 have newer version or that the script is wrong.
> There is still a lot of work to have something usefull, I will post the
> script as soon as it's ready to be reviewed.

Thanks, definitely looks interesting. Please post your script when you
think it's ok, but don't wait to much: the earlier the better, so that
you can get early feedback, and maybe help/testing from others.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
