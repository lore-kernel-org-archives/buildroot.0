From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:16:07 +0200
Subject: [Buildroot] [PATCH RESEND] qt: add QT_COORD_TYPE to double
 option
In-Reply-To: <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
References: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
 <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150426121607.36078db2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Wed, 22 Apr 2015 10:34:18 +0200, Richard Genoud wrote:
> From: Julien D'Ascenzio <jdascenzio@paratronic.fr>
> 
> On ARM-based platforms, qreal is a typedef for float for performance
> reasons.
> But we may want a double precision anyway.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
> Rebased and compiled on master (21 april 2015) for arm926ej-s

Applied after slightly improving the Config.in help text, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
