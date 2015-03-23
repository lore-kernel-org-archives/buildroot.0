From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 13:55:52 +0100
Subject: [Buildroot] [PATCH 3/7 v3] support/download: add explicit
	no-hash support
In-Reply-To: <550EE865.6040302@mind.be>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <93d0033f46edcbeeb4de1e7bfad36e7970fb24b4.1427037564.git.yann.morin.1998@free.fr>
 <550EE865.6040302@mind.be>
Message-ID: <CAHXCMM+RUO0CQfYdx8_fphKp--qUwjCV2kKnC26ob5OmO8ZHUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2015 at 5:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22/03/15 16:21, Yann E. MORIN wrote:
>> Add support to explicitly state that an archive has no hash.
>>
>> This can be used for archives downloaded from a repository, like a
>> git-clone or a subversion checkout, or using the github helper.
>>
>> This will come in handy when we'll eventually make hashes mandatory as
>> soon as a .hash file exists: for some packages, like gcc, some versions
>> are downloaded as archives from upstream, while other versions may come
>> from a GitHub repository (via the github herlper).
>>
>> In this case, a .hash file would exist, that contains hashes for the
>> downloaded tarballs, but archives downloaded from the repository would
>> not have a hash (since it is currently not possible to have reproducible
>> such archives). So, we'd need a way to explicitly state there is no
>> hash, on purpose, for those archives.
>>
>> So, add 'none' as a new type of hash.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
