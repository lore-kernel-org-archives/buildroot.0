From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 04:56:06 -0600
Subject: [Buildroot] [PATCH 1/2] support/scripts/graph-build-time: add
 download times
In-Reply-To: <20190130201156.5927-1-patrickdepinguin@gmail.com>
References: <20190130201156.5927-1-patrickdepinguin@gmail.com>
Message-ID: <CANQCQpYkibAarMbiZZUFNtyLK6k-2KJE-GdWdKTGfmjfi-_pnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De,

On Wed, Jan 30, 2019 at 2:12 PM Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>
> From: Mathias De Mare <mathias.de_mare@nokia.com>
>
> Total build time also involves download. Getting a visibility on the impact
> of that step can be important for users/admins, e.g. to evaluate different
> methods of BR2_PRIMARY_SITE.
>
> Colors used are some kind of purple (primary scheme) and light orange
> (alternate scheme).
>
> Signed-off-by: Mathias De Mar? <mathias.de_mare@nokia.com>
> [ThomasDS: rebase and update colors to avoid confusion]
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Cool stat :-)  This will be interesting to run and see what is not
hitting my caching server vs raw Internet.

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
