From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 14:53:31 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
In-Reply-To: <20718_1552396490_5C87B0CA_20718_131_1_20190312131447.GA25212@r-lnx-nyma7486-2>
References: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
 <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
 <20718_1552396490_5C87B0CA_20718_131_1_20190312131447.GA25212@r-lnx-nyma7486-2>
Message-ID: <b2ce6da8-e324-7ac5-d386-60c0ec8925f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 14:14, yann.morin at orange.com wrote:
> I'd like the ability to extract many unrelated variables, but not all of
> them either, so maybe we can accept that VARS is a sapce-separated list
> of patterns to extract, ?-la:
> 
>     make -s printvars VARS="VAR_1 VAR_2 PAT_1_% PAT_2_%"

 This has worked ever since we introduced VARS...

 Regards,
 Arnout
