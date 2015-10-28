From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Oct 2015 01:59:02 +0100
Subject: [Buildroot] [PATCH v3] sane-backends: add systemd support
In-Reply-To: <1444731493-22371-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444731493-22371-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151028015902.49ff139e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 13 Oct 2015 11:18:13 +0100, Vicente Olivert Riera wrote:
> The content of the saned.socket and saned at .service files is based on the
> instructions of the sane-backends manual.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>   - Create the "target.wants" directories for the socket and the service
>     and put symlinks in there pointing to the real files. (Suggested by
>     Maxime Hadjinlian)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
