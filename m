From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:49:10 +0100
Subject: [Buildroot] [PATCH v4 01/18] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <1479905937-17241-2-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-2-git-send-email-jezz@sysmic.org>
Message-ID: <20161123224910.7e2e39b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:40 +0100, J?r?me Pouiller wrote:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> When reproducibility is requested, generate a global SOURCE_DATE_EPOCH
> environment variable which contains either the date of Buildroot last
> commit if running from a git repository, or the latest release date.
> 
> This means that all packages embedding build dates will appear to
> have the same build date, so in case of new commit or release, all
> packages will appear to have been changed, even though some of them
> may not have changed in fact.
> 
> The meaning of SOURCE_DATE_EPOCH is specified by the following
> specification:
>   https://reproducible-builds.org/specs/source-date-epoch/
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
