From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 27 Oct 2013 09:27:14 +0100
Subject: [Buildroot] [PATCH v3 1/2] packages/Config.in: Alphabetical
 entries sorting
In-Reply-To: <1382713552-29095-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382713552-29095-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LXuJO3mvgZzdmwVFJBGtPdbRf0XBMk=zTAPyERGEVgJ9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 5:05 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> This patch moves :
>   "Filesystem and flash utilities" menu
>   "X applications" category
>   "JSON/XML" menu
> so they are in alphabetical order with the rest of the file.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v2 -> v3:
>   - Fix an endmenu moved at the wrong place
> Changes v1 -> v2:
>   - Remove the move of "Misc devices firmwares" (suggested by Thomas De
>     Schampheleire)
> ---
>  package/Config.in | 114 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 57 insertions(+), 57 deletions(-)

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
