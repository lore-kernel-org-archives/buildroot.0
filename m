From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 16 Mar 2010 23:13:14 +0000
Subject: [Buildroot] make distclean leaves ~200 files
	under	package/config/
In-Reply-To: <hnotpq$1pr$1@dough.gmane.org>
References: <hnoqma$lhv$1@dough.gmane.org> <20100316223047.44094042@surf>
	<hnotpq$1pr$1@dough.gmane.org>
Message-ID: <4BA0108A.1070607@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/03/2010 21:39, Grant Edwards wrote:
> output/ by default).
>    
> Ah, I see find that a patch has already been submitted:
>
>    https://bugs.uclibc.org/show_bug.cgi?id=1213
>
> I thought I remembered this having been discussed before, but I didn't
> search for the right words the first time I looked...
>
>    

Would be great if you could test my patch. If someone else signs off on 
it, there's a better chance of inclusion ;)

Will
