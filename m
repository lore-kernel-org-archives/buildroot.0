From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 23 Jun 2019 15:20:25 +0200
Subject: [Buildroot] [PATCH 0/3] Update Busybox to 1.31 and use mdev
 daemon mode
In-Reply-To: <db790277-70c6-47d5-6ea5-02444579522d@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190620163154.7a6b743b@windsurf> <87a7ecffta.fsf@dell.be.48ers.dk>
 <db790277-70c6-47d5-6ea5-02444579522d@railnova.eu>
Message-ID: <e36171f9-f7cf-4548-37c6-92a57e6b9bf7@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 6/20/19 6:02 PM, Titouan Christophe wrote:
> Hello all,
> 
> On 6/20/19 5:16 PM, Peter Korsgaard wrote:
>> Yes, thanks. We still need to force CONFIG_NET=y in the Linux kernel if
>> mdev is enabled, right?
>>
> 
> Yes, since mdev is now launched in daemon mode CONFIG_NET is now needed. 
> Didn't think of enforcing that in the kernel config, I'm preparing a 
> patch right now.
> 
> Regards,
> 
> Titouan

The patch has been submitted here 
http://patchwork.ozlabs.org/patch/1119590/.

Titouan
