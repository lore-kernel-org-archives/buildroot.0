From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Jan 2011 20:11:54 +0100
Subject: [Buildroot] [PATCH 5/6] Do not mention
	toolchain/uClibc/uClibc.config-locale
In-Reply-To: <e24f48609cc9c204ff7df26fe82f7fa1eb1322c0.1296398261.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 30 Jan 2011 15:37:49 +0100")
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
	<cover.1296398261.git.thomas.petazzoni@free-electrons.com>
	<e24f48609cc9c204ff7df26fe82f7fa1eb1322c0.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y662w6it.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The uClibc configuration file toolchain/uClibc/uClibc.config-locale
 Thomas> does not exist anymore.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  docs/buildroot.html |   10 ++++------
 Thomas>  1 files changed, 4 insertions(+), 6 deletions(-)

 Thomas> diff --git a/docs/buildroot.html b/docs/buildroot.html
 Thomas> index e815ee9..04cbe67 100644
 Thomas> --- a/docs/buildroot.html
 Thomas> +++ b/docs/buildroot.html
 Thomas> @@ -409,9 +409,8 @@
 Thomas>        your configuration changes as appropriate.</li>
 
 Thomas>        <li>Copy the <code>.config</code> file to
 Thomas> -      <code>toolchain/uClibc/uClibc.config</code> or
 Thomas> -      <code>toolchain/uClibc/uClibc.config-locale</code>. The former
 Thomas> -      is used if you haven't selected locale support in Buildroot
 Thomas> +      <code>toolchain/uClibc/uClibc.config</code>. The former is used
 Thomas> +      if you haven't selected locale support in Buildroot
 Thomas>        configuration, and the latter is used if you have selected
 Thomas>        locale support.</li>

Hmm, this sounds wrong. Now you only have one file, so talking about
former and latter doesn't make sense.

-- 
Bye, Peter Korsgaard
