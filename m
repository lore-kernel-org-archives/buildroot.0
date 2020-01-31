From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jan 2020 10:30:27 +0100
Subject: [Buildroot] [PATCH] package/collectd: add config option for lua
In-Reply-To: <4eaf8f1f-629a-93ef-fc37-1c23c185f893@orolia.com> (Tom Marcuzzi's
 message of "Fri, 31 Jan 2020 09:14:16 +0000")
References: <20200127172740.11610-1-tom.marcuzzi@orolia.com>
 <87pnf0shr4.fsf@dell.be.48ers.dk>
 <4eaf8f1f-629a-93ef-fc37-1c23c185f893@orolia.com>
Message-ID: <87v9osq8gc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tom" == Tom Marcuzzi <tom.marcuzzi@orolia.com> writes:

 > Hi Peter,
 > On 1/30/20 11:26 PM, Peter Korsgaard wrote:
 >>>>>>> "Tom" == Tom Marcuzzi <tom.marcuzzi@orolia.com> writes:
 >> 
 >> > Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
 >> 
 >> Why? What is wrong with the automatic dependency?
 >> 

 > It is not that there is anything wrong with the automatic dependency, 
 > but in my humble opinion adding the lua option may be a more logical way 
 > of doing in regards to the other collectd plugins, since every 
 > implemented plugin has a configuration option. This gives more 
 > flexibility and is more explicit since the user can choose himself 
 > whether he wants the plugin or not, which is not the case with the 
 > automatic dependency.

But if your system has collectd and lua enabled, what would the reason
be to not enable lua support in collectd? How much extra size does this
add to collectd?

-- 
Bye, Peter Korsgaard
