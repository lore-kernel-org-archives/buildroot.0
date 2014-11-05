From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 5 Nov 2014 16:51:25 +0100
Subject: [Buildroot] [RFC/PATCH] Makefile: guarantee reproducible
	permissions
In-Reply-To: <20141105144624.GA1257@fox>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
 <54580079.2070603@mind.be> <20141105144624.GA1257@fox>
Message-ID: <CA+TH9VnK7iiTSXwfn_iNNoEDiQ7WnkTFz4_tANRfY-nUW3wNYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,

> Are you sure? I think rsync is used to copy the sysroot to the staging
> dir (output/host). The target is then filled with various 'install -m's
> for each library, so the previous set of permissions wouldn't matter.

The mono package uses rsync to install some libraries in target, so
it's an exception.

Sincerely, Angelo
