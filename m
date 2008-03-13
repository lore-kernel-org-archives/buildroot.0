From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Mar 2008 19:23:58 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
In-Reply-To: <20080313171042.D38B5120156@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 13 Mar 2008 10\:10\:42 -0700 \(PDT\)")
References: <20080313171042.D38B5120156@busybox.net>
Message-ID: <87prty5vpd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-13 10:10:40 -0700 (Thu, 13 Mar 2008)
 ninevoltz> New Revision: 21325

 ninevoltz> Log:
 ninevoltz> make patch-kernel create lists of applied patches, very handy indeed

 ninevoltz> Modified:
 ninevoltz>    trunk/buildroot/toolchain/patch-kernel.sh


 ninevoltz> Changeset:
 ninevoltz> Modified: trunk/buildroot/toolchain/patch-kernel.sh
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/toolchain/patch-kernel.sh	2008-03-13 07:38:10 UTC (rev 21324)
 ninevoltz> +++ trunk/buildroot/toolchain/patch-kernel.sh	2008-03-13 17:10:40 UTC (rev 21325)
 ninevoltz> @@ -37,6 +37,7 @@
 ninevoltz>      esac
 ninevoltz>      echo ""
 ninevoltz>      echo "Applying ${i} using ${type}: " 
 ninevoltz> +	echo ${i} | cat >> ${targetdir}/.applied_patches_list

What's the purpose of cat?

-- 
Bye, Peter Korsgaard
