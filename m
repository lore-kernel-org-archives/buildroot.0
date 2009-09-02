From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 2 Sep 2009 11:57:07 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <87k50hpyez.fsf@macbook.be.48ers.dk>
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
	<87skf6pvi6.fsf@macbook.be.48ers.dk>
	<20090901150717.GC17682@buzzloop.caiaq.de>
	<87ocpupueq.fsf@macbook.be.48ers.dk>
	<20090901225917.GE9410@buzzloop.caiaq.de>
	<87k50hpyez.fsf@macbook.be.48ers.dk>
Message-ID: <20090902095707.GA18915@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 02, 2009 at 10:02:12AM +0200, Peter Korsgaard wrote:
>  Daniel> But I understand that you're hessitant, so drop that part if you like,
>  Daniel> and we remove the installed files later from our postbuild script. No
>  Daniel> problem :)
> 
> Ok, added without that part. Notice that libarchive needs wchar support:
> 
> libarchive/archive_entry.c: In function 'aes_get_wcs':
> libarchive/archive_entry.c:234: error: implicit declaration of function 'mbstowcs'
> 
> I've fixed the kconfig to ensure that.

Thanks :)
