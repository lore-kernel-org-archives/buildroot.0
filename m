From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 12:03:33 -0300
Subject: [Buildroot] [PATCH 8/9] libcuefile: convert to cmaketargets
	infrastructure
In-Reply-To: <20110127154244.198d4077@surf>
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>	<1296138094-502-8-git-send-email-gustavo@zacarias.com.ar>
	<20110127154244.198d4077@surf>
Message-ID: <4D418945.5020108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/27/11 11:42, Thomas Petazzoni wrote:

> I would prefer to let the infrastructure do the target/staging
> installation, and use the post-staging-install and post-target-install
> hooks to do the headers copy trick.
> 
> Thomas

Fair enough, sent PATCHv2.
