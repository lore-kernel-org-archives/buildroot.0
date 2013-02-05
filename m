From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 21:04:55 +0100
Subject: [Buildroot] [PATCH 1/4] manual: add section about storing the
	configuration.
In-Reply-To: <c389b413e9f055bfcc89bfd014a8a7c7e36b1819.1360084128.git.arnout@mind.be>
 (Arnout Vandecappelle's message of "Tue, 5 Feb 2013 18:15:59 +0100")
References: <cover.1360084128.git.arnout@mind.be>
 <cover.1360084128.git.arnout@mind.be>
 <c389b413e9f055bfcc89bfd014a8a7c7e36b1819.1360084128.git.arnout@mind.be>
Message-ID: <87ehguplw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Reuse part of board-support.txt, and remove that one because it
 Arnout> was unused.

Committed with minor fixes (see below).

 Arnout> +Other package configuration
 Arnout> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
 Arnout> +
 Arnout> +The configuration files for busybox, the linux kernel, barebox, uClibc and
 Arnout> +crosstool-NG should be stored as well. For each of these, a

s/as well/as well if changed/

 Arnout> +* For crosstool-NG and at91bootstrap3 and no helper exists so you
 Arnout> +  have to copy the config file manually to

s/at91bootstrap3 and no/at91bootstap3, no/

-- 
Bye, Peter Korsgaard
