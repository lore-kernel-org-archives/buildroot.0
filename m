From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 12:14:57 +0200
Subject: [Buildroot] [PATCH 4 of 5 v3 for 2014.08] manual-text: make
 sure URLs are displayed if a link text was provided
In-Reply-To: <72d825eab688116985f2.1407957950@localhost>
References: <patchbomb.1407957946@localhost>
 <72d825eab688116985f2.1407957950@localhost>
Message-ID: <CAHXCMMJ6oVjSpCHMgtvb6dPH7hL9jQeUXE_r3c6DOo-cYqKYig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2014 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> When the asciidoc source contain URLs of the form:
>     http://example.com[An example website]
> the text representation of the manual would only contain:
>     An example website
> without displaying the actual URL.
>
> This patch adds an asciidoc configuration file that sets the inline macros
> for several URL types so that the display becomes:
>     An example website [http://example.com]
> For URLs where no link text was provided, the display becomes:
>     http://example.com
> which is the same as before.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
