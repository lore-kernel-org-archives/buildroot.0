From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 22:59:32 +0200
Subject: [Buildroot] [PATCH v2] package/ripgrep: new package
In-Reply-To: <20191006155649.GD5258@ned>
References: <20191003003146.942555-1-sam.voss@gmail.com>
 <20191006155649.GD5258@ned>
Message-ID: <f08b4a2a-a797-c96d-5d08-eab82d79e5d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/10/2019 17:56, Eric Le Bihan wrote:
> Hi!
> 
> On 2019-10-02 19:31, sam.voss at gmail.com wrote:
>> From: Sam Voss <sam.voss@gmail.com>
>>
>> Signed-off-by: Sam Voss <sam.voss@gmail.com>
>> ---
>> Changes v1 -> v2:
>>   - Fix depends-on values
>>   - Add hash for license files
>>   - Make indentation consistant
> 
> A bit late, but LGTM. In my own version [1], I added
> '--jobs=$(PARALLEL_JOBS)' to $(RIPGREP_CARGO_OPTS), but in the end, it
> seems useless.
> 
> Now that there is one package using Cargo in Buildroot, should the
> pkg-cargo infrastructure be added?

 I would absolutely welcome pkg-cargo infrastructure. I would also welcome
additional rust packages.

 However, before working on pkg-cargo infrastructure, I think it would be a good
idea to finish the rustc bump because I think it will (when done properly)
simplify the rust/cargo infra a little bit.

 Regards,
 Arnout


> 
> [1] https://github.com/elebihan/br2-ext-rust/tree/master/package/ripgrep
> 
> Regards,
> 
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
