From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Sep 2014 08:00:02 -0300
Subject: [Buildroot] [PATCH v2 2/2] iprutils: Fix static build by
 passing the libraries in the right order
In-Reply-To: <1411032208-62586-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1411032208-62586-1-git-send-email-Vincent.Riera@imgtec.com>
 <1411032208-62586-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <541C0CB2.9060307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/2014 06:23 AM, Vicente Olivert Riera wrote:

> This mistake was causing failures like this one:
> 
> m_post.c:(.text+0x60): undefined reference to `wattr_on'
> 
> Patch sent upstream:
>   https://sourceforge.net/p/iprdd/iprutils/merge-requests/1/
> 
> Fixes:
>   http://autobuild.buildroot.net/results/500/5004e7b230635e0605acdd17d2b7d2d01fc5075c/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
