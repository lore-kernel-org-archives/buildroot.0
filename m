From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 May 2009 09:58:08 -0300
Subject: [Buildroot] [PATCH] sqlite3: Bump version and switch
	to	'amalgamation'-mode
In-Reply-To: <1242385533-19611-1-git-send-email-mroth@nessie.de>
References: <1242385533-19611-1-git-send-email-mroth@nessie.de>
Message-ID: <4A0D66E0.4020301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael Roth wrote:

> Bumped to new sqlite version with speed improvements,
> bug fixes and enhanced query optimizer.
> 
> Additionally, switched to the 'amalgamation'-tar.gz
> because the traditional tar.gz for 3.6.14 is broken.
> 
> Anyway, the 'amalgamation' is recommended and the
> traditionally tar.gz is not supported anymore by
> the SQlite developers.
> 
> See:
> 	http://www.sqlite.org/download.html
> 	http://www.sqlite.org/amalgamation.html
> 
> Closes #333.

Amalgamation gives a library that's a tad bigger, 387951 bytes versus
390903 for an armv4 eabi target.
Works for me and i don't mind the extra size (less than 1%) since IMHO
sqlite isn't for those interested in saving that last byte.
No need for this to go into 2009.05 though.
Regards.
