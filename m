From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 21 Oct 2018 12:53:47 +0100
Subject: [Buildroot] [PATCH v4 1/2] core/legal-info: Change order of
 legal-manifest parameters
In-Reply-To: <27c79fec-f680-6a5f-4fad-601be5ecf700@lucaceresoli.net>
References: <20180822124014.23046-1-sojkam1@fel.cvut.cz>
 <27c79fec-f680-6a5f-4fad-601be5ecf700@lucaceresoli.net>
Message-ID: <8b318840-c873-06d6-4fc0-1edf4720f927@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

On 21/10/18 12:27, Luca Ceresoli wrote:
> Hi,
> 
> On 22/08/18 14:40, Michal Sojka wrote:
>> From: Michal Sojka <sojka@merica.cz>
>>
>> The last parameter {HOST|TARGET} is now first. With this change,
>> adding new columns to the legal manifest file (as in the next commit)
>> will be slightly easier to review.
>>
>> Signed-off-by: Michal Sojka <sojka@merica.cz>
>> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

...except the patch does not apply on current master. Since the conflict
is trivial and unrelated, and I already fixed it for my testing, I'm
sending the fixed pathces as v5.

-- 
Luca
