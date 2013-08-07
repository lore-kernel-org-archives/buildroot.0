From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 13:21:30 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <520227E5.30300@googlemail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <52020215.6030609@googlemail.com>
 <CAAXf6LVgBpK7DTySYdHTNRnstpQWg8UjQcNRvpSmcLSaSbPXEA@mail.gmail.com>
 <520227E5.30300@googlemail.com>
Message-ID: <CAAXf6LWLf0uR1L1zxuCRD3uyvvqAA4twMicLCELvmO3is9e=cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2013 at 12:56 PM, Carsten Schoenert
<c.schoenert@gmail.com> wrote:
> env | grep  "SHELL\|TERM"

In my case:

SHELL=/bin/bash
TERM=xterm
