From: Micha Nelissen <micha@neli.hopto.org>
Date: Mon, 06 Oct 2008 18:00:41 +0200
Subject: [Buildroot] [PATCH] enhance directfb configurability
In-Reply-To: <d6cda7730810060855n6f1f710cmb149c7b3165ef29d@mail.gmail.com>
References: <gc8h2p$eil$2@ger.gmane.org>
	<d6cda7730810060855n6f1f710cmb149c7b3165ef29d@mail.gmail.com>
Message-ID: <48EA3629.3030504@neli.hopto.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a wrote:
> I'm not sure if forcing static lib on everyone is the right thing. If
> there is only one application on the system that depends on DirectFB,
> it might save some bytes, but if there are more than 1, shared lib
> would be prefered.

Wouldn't shared lib linking be the default? The static variant would 
need to be referenced explicitly by someone who wants to use it; but at 
least it's available. It also would only exist in the staging_dir, not 
the target dir.

Thanks,
Micha
