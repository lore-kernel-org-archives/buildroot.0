From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Date: Fri, 31 Jan 2020 09:50:56 +0000
Subject: [Buildroot] [PATCH] package/collectd: add config option for lua
In-Reply-To: <87v9osq8gc.fsf@dell.be.48ers.dk>
References: <20200127172740.11610-1-tom.marcuzzi@orolia.com>
 <87pnf0shr4.fsf@dell.be.48ers.dk>
 <4eaf8f1f-629a-93ef-fc37-1c23c185f893@orolia.com>
 <87v9osq8gc.fsf@dell.be.48ers.dk>
Message-ID: <9cee41af-93e1-20e6-8cb9-89e54e38dc3e@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/31/20 10:30 AM, Peter Korsgaard wrote:
>>>>>> "Tom" == Tom Marcuzzi <tom.marcuzzi@orolia.com> writes:
> 
>   > Hi Peter,
>   > On 1/30/20 11:26 PM, Peter Korsgaard wrote:
>   >>>>>>> "Tom" == Tom Marcuzzi <tom.marcuzzi@orolia.com> writes:
>   >>
>   >> > Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
>   >>
>   >> Why? What is wrong with the automatic dependency?
>   >>
> 
>   > It is not that there is anything wrong with the automatic dependency,
>   > but in my humble opinion adding the lua option may be a more logical way
>   > of doing in regards to the other collectd plugins, since every
>   > implemented plugin has a configuration option. This gives more
>   > flexibility and is more explicit since the user can choose himself
>   > whether he wants the plugin or not, which is not the case with the
>   > automatic dependency.
> 
> But if your system has collectd and lua enabled, what would the reason
> be to not enable lua support in collectd? How much extra size does this
> add to collectd?

It adds on my system around 18KB. I agree that the reason not to enable 
lua support may be unclear. My patch is more about consistency, in 
regard to what has been done before for the previous plugins, which are 
not enabled by default.

Regards,

Tom Marcuzzi
