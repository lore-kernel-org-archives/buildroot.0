From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 12 May 2014 11:06:45 +0100
Subject: [Buildroot] [PATCH 1/2] mongoose: bump to version 5.3
In-Reply-To: <1399807447-9469-1-git-send-email-zinosat@tiscali.it>
References: <1399807447-9469-1-git-send-email-zinosat@tiscali.it>
Message-ID: <53709D35.90002@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/2014 12:24, Davide Viti wrote:
> From: Davide Viti <d.viti@infosolution.it>
>
>
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
> Mongoose has changed quite drastically in the last months.
> Here is a list of changes which had to be applied:
>
>   - Bump version from 3.7 to 5.3
>   - use tarball download via github helper iso git clone
>   - need largefile support
>   - compilation takes place into "examples"
>   - weberver source is now "server.c"
>   - adapt to new command line options
>   - SSL support now controlled via NS_ENABLE_SSL
>
> I'd appreciate some feedback in particular on the SSL change: the old
> NO_SSL_DL and NO_SSL macros have been removed and the only SSL-related
> macro is now NS_ENABLE_SSL.
>

Minot point, the new version of mongoose changes the license to GPLv2.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
