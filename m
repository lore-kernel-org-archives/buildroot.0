From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Jan 2011 10:45:17 -0300
Subject: [Buildroot] [PATCH 4/5] libao: new package
In-Reply-To: <877hec5tvz.fsf@macbook.be.48ers.dk>
References: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>	<1294339321-5659-4-git-send-email-gustavo@zacarias.com.ar>
	<877hec5tvz.fsf@macbook.be.48ers.dk>
Message-ID: <4D2C5EED.7040607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/11 18:30, Peter Korsgaard wrote:

> This seems to atleast need host-pkg-config:
> 
> ./configure: line 14903: /home/peko/source/buildroot/output2/host/usr/bin/pkg-config: No such file or directory
> *** Your version of pkg-config is too old. You need version 0.9.0 or newer.
> *** See http://www.freedesktop.org/software/pkgconfig
> 
> And configure also picks up a lot of host files, that might cause
> problems:

Missed the pkg-config bit since it was pulled in by other packages i was
testing, doh!
New version follows with disabled everything that the host could provide
and fixed dep.
