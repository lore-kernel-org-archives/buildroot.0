From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 08:58:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/docs
In-Reply-To: <20081014162055.A36573C873@busybox.net> (aldot@uclibc.org's
	message of "Tue\, 14 Oct 2008 09\:20\:55 -0700 \(PDT\)")
References: <20081014162055.A36573C873@busybox.net>
Message-ID: <87prlyo0dk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aldot" == aldot  <aldot@uclibc.org> writes:

 aldot> Author: aldot
 aldot> Date: 2008-10-14 09:20:55 -0700 (Tue, 14 Oct 2008)
 aldot> New Revision: 23678

 aldot> Log:
 aldot> - extend documentation to mention adding package/foo/Config.in to package/Config.in

 aldot> +if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 aldot> +source "package/procps/Config.in"
 aldot> +endif
 aldot> +</pre>
 aldot> +   <p><strong>Note:</strong><br>
 aldot> +   Generally all packages should live <em>directly</em> in the
 aldot> +   <code>package</code> directory to make it easier to find them.
 aldot> +   </p>

Is that the agreement we have? It seems to be counter to the latest
changes (package/audio, package/database, ..)

-- 
Bye, Peter Korsgaard
