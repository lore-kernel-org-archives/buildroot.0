From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 21 Oct 2018 11:27:46 +0100
Subject: [Buildroot] [PATCH v4 1/2] core/legal-info: Change order of
 legal-manifest parameters
In-Reply-To: <20180822124014.23046-1-sojkam1@fel.cvut.cz>
References: <20180822124014.23046-1-sojkam1@fel.cvut.cz>
Message-ID: <27c79fec-f680-6a5f-4fad-601be5ecf700@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 22/08/18 14:40, Michal Sojka wrote:
> From: Michal Sojka <sojka@merica.cz>
> 
> The last parameter {HOST|TARGET} is now first. With this change,
> adding new columns to the legal manifest file (as in the next commit)
> will be slightly easier to review.
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
