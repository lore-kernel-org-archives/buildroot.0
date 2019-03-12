From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 12 Mar 2019 16:26:07 +0100
Subject: [Buildroot] [PATCH] package/python3: require util-linux'
 <uuid.h>
In-Reply-To: <20190307212437.22ce6f91@windsurf>
References: <e5b1510a81bda096dacc133276f1ff2643131dcc.1551975775.git.jan.kundrat@cesnet.cz>
 <20190307212437.22ce6f91@windsurf>
Message-ID: <86dde90f-6800-4fbb-a7f8-67032a460d77@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Is this with the per-package directory patch set applied, or top-level
> parallel build with the Buildroot master (which is a totally
> unsupported configuration) ?

It was with the totally unsupported top-level parallel build with Buildroot 
master. I thought that it was just a mere issue with dependencies, but 
apparently it's a fragile upstream. I can confirm that the per-package 
directory patch makes it stable.

As such, I think that there's little point in fixing this within buildroot. 
I'm looking forward towards a merge of the per-package build dir. Sorry for 
noise!

With kind regards,
Jan
