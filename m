From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Wed, 6 Sep 2017 07:59:10 +0000
Subject: [Buildroot] [PATCH 1/3] libv4l: ensure libv4l gets built,
 fixes mediastreamer build
In-Reply-To: <20170905095721.452d5364@windsurf.lan>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
 <da42963b-92b1-6d88-8fc3-658c2712c7d3@st.com>
 <20170905095721.452d5364@windsurf.lan>
Message-ID: <523ab49f-a60b-819d-a77f-19a164c4d10d@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Tested OK on my side with STM32F429I-EVAL board running no-MMU STM32F429 
chip.

Tested-by: Hugues Fruchet <hugues.fruchet@st.com>

Best regards,
Hugues.

On 09/05/2017 09:57 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 5 Sep 2017 07:49:49 +0000, Hugues FRUCHET wrote:
>> Thanks for this Thomas,
>>
>> I will test on my side and push on v4l-utils repo.
> 
> I have already submitted the patch to the v4l-utils maintainer, who is
> waiting for your test to apply the patch.
> 
> Thanks!
> 
> Thomas
> 
