From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Tue, 29 Nov 2016 21:43:20 -0800
Subject: [Buildroot] preparing for release
In-Reply-To: <20161130053136.GU14207@waldemar-brodkorb.de>
References: <20161130053136.GU14207@waldemar-brodkorb.de>
Message-ID: <e7ecce02-d228-f356-f47b-5de95d8261d4@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+CC Thomas for buildroot aspect

On 11/29/2016 09:31 PM, Waldemar Brodkorb wrote:
> Hi,
>
> I am preparing a release and would like to remove UCLIBC_HAS_LFS
> before doing it.
>
> I believe UCLIBC_HAS_LFS does make the code more complex and
> the benefit to disable it to save some bytes is not high enough.
>
> Most users have UCLIBC_HAS_LFS enabled and it is enabled by default.
>
> Attached is a patch.
>
> Any comments?
>
> best regards
>  Waldemar

I welcome this change - is there going to be impact on downstream projects like
busybox. What if it some disables CONFIG_LFS inside busybox ?

-Vineet
