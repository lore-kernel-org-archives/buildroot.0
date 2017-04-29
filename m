From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:25:33 +0200
Subject: [Buildroot] [PATCH v3] x11vnc: update to 0.9.14
In-Reply-To: <20170429130034.30200-1-martink@posteo.de>
References: <65322dd8-3b6b-e421-5e5b-9c69d88355a3@mind.be>
 <20170429130034.30200-1-martink@posteo.de>
Message-ID: <20170429152533.4d905257@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 15:00:34 +0200, Martin Kepplinger wrote:
> This switches to x11vnc's new upstream location at github. Autoreconf is
> added because it's only a code snapshot release. Subsequent releases
> will most probably look the same, see
> https://github.com/LibVNC/x11vnc/issues/35#issuecomment-297474900
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---

Applied to master, thanks. Since you are interested in x11vnc, can you
add yourself as a developer for this package in the DEVELOPERS file ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
