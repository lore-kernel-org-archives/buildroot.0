From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Oct 2015 14:34:16 +0000
Subject: [Buildroot] [PATCH] core: add a 'make version' rule
In-Reply-To: <1445956167-11122-1-git-send-email-yann.morin.1998@free.fr>
References: <1445956167-11122-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <562F8B68.7060204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/27/2015 02:29 PM, Yann E. MORIN wrote:
> We often ask people for the version they are using when they ask for
> help (either on the list or on IRC). Some of them do not even know which
> version they are using.
> 
> Add a make rule to dump the full version string.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ make version
2015.11-git-00809-g13578ba

Regards,

Vincent.
