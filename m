From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Nov 2015 11:35:27 -0300
Subject: [Buildroot] [PATCH] espeak: fix build on sparc64
In-Reply-To: <1448634261-6630-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1448634261-6630-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56586A2F.3040905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/15 11:24, Thomas Petazzoni wrote:

> sparc64 needs object files to be built with -fPIC in order to be
> usable in shared libraries, otherwise the shared library cannot be
> created.
>
> Fixes:
>
>    http://autobuild.buildroot.org/results/8b8/8b894f0bd42c18e7cda98c15480757f10d743423/

Hi.
I wonder if all these sparc fixes wouldn't be better suited for the 
wrapper, after all -fpic in sparc is generally useless, and try to 
handle these upstream would be a PITA.
Regards.
