From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Thu, 9 Feb 2017 18:07:29 +0100
Subject: [Buildroot] [PATCH 2/6] support/test-pkg: store lines missing
 from resulting configuraiton
In-Reply-To: <bad3fa5a5e3580885fb587dc22cd933b92e82f69.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <bad3fa5a5e3580885fb587dc22cd933b92e82f69.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <53bd461f-4924-b835-7500-83c3fddedd0e@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 08/02/2017 21:15, Yann E. MORIN wrote:
> When a build is skipped, store the lines from the config snippet, that
> are missing in the resulting configuration, in a file in the build
> directory, for the user to inspect.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>


-- 
Luca
